class Accountreceivable < ActiveRecord::Base
  #Hasta Ahora los comprobantes de 100% banco no funcionan. No se pueden leer
   #Hasta Ahora los comprobantes de Benplus no funcionan. No se pueden leer
   #Resta por hacer validaciones de fecha y numero de cuenta a acreditar. MOnto tambien
  belongs_to :client
  belongs_to :constant
  mount_uploader :document, DocumentUploader
  validates :client_id, presence: true
  validates :date, presence: true, on: :update
  validates :concept, presence: true, on: :create
  validates :status, presence: true, on: :create
  validates :paymentType, presence: true, on: :update
  validates :month, presence: true, on: :create
  validates :paid, presence: true
  validates :bank, presence: true, on: :update
  validates :amountPaid, presence: true, on: :update
  

  #validates_numericality_of :transferNumber
  #validates_numericality_of :accountNumber
  #validates_numericality_of :amountPaid, acceptance: { message: 'No es Numérico' }
  #validates_numericality_of :accountNumber, acceptance: { message: 'No es Numérico' }
  #validates_numericality_of :transferNumber, acceptance: { message: 'No es Numérico' }
  
  after_save :importProof
  before_save :validator
  before_save :calculateBaseAmount
  before_save :calculateBasicAmount
  before_save :calculateAmountWithTax
  before_save :calculateRetentions
  before_save :calculateTotalAmountPerceive

  

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.slice(*accessible_attributes)
      product.save!
    end
  end
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Csv.new(file.path, nil, :ignore)
    when '.xls' then Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  def validator
    if self.paymentType == "deposito"
      raise self.paymentType.to_yaml
      validates :amountPaid, presence: true
      
    end
  end

  def importProof
    
      #raise ((document.filename.to_s).length).to_yaml
      if ((document.filename.to_s).length) > 0
      path = '/home/daniel/Documentos/Proyecto/proyecto/public/uploads/'+month+'/'+((client.rif).to_s + client.name)+'/'+document.filename
      #path = '/home/daniel/Documentos/Proyecto/proyecto/public/uploads/Banesco.pdf'
      patch = path.tr("'", '"') 
      #raise patch.to_yaml
      reader = PDF::Reader.new(Rails.root.join(patch))
      end
      if ((document.filename.to_s).length) > 0
     	  #reader = PDF::Reader.new(document.filename)
         

          reader.pages.each do |page|
       	    texto = page.text
       	    #raise texto.to_yaml
            linea = texto.delete(' ')
            linea.gsub!(/\s+/, ' ').split(" ")    
            #MERCANTIL
            if linea.include? "MercantilenLínea"
              mercantil(linea)  
            #BANESCO
            else if linea.include? "J­07013380"
              banesco(linea)
            #PROVINCIAL
            else if linea.include? "Gracias por utilizar Provinet"
           	 provincial(linea)
              #BICENTENARIO
            else if linea.include? "BicentenarioBancoUniversal"
              bicentenario(linea)
            end
            end
          end
        end
      
      end
      #else
      # raise (4+3).to_yaml  #No se adjunto comprobante bancario
     
    end
  end

  private

 
  def calculateBaseAmount
  	 @constant = Constant.last
  	if !self.baseAmount
  		if concept == "mensualidad"

        if @constant.oldMonthlyPayment
          self.baseAmount = @constant.oldMonthlyPayment * client.localAmount
        else
  	     self.baseAmount  = @constant.monthlyPayment * client.localAmount
        end
  	 	end
  	 	if concept == "instalacion"
  	 		self.baseAmount  = @constant.installPayment * client.localAmount
  	 	end
  	 	if concept == "instalacionMensualidad"
  	 		self.baseAmount = @constant.completePayment * client.localAmount
  	 	end
  	 	if concept == "reactivacion"
  	 		self.baseAmount  = @constant.reactivationPayment * client.localAmount
  	 	end
   	end
   
  end
  def calculateBasicAmount
  	resultado = 0

  	client.discounts.each do |discount|
  		
  		resultado = resultado + discount.percentage

  		
  	end
    if client.specialDiscount
     resultado = resultado + client.specialDiscount
    end
  	
  	self.amountWithoutTax = ((baseAmount * ( 1 - (resultado.to_f/100))) * client.localAmount)
  	
  	#raise (Settings.monthlyPayment * ( 1 - (client.discounts.find(1).percentage.to_f/100))).to_yaml
  	
  end

  def calculateAmountWithTax
  	#raise amountWithoutTax.to_yaml
  	
  	self.amountWithtTax =  eval(sprintf("%14.4f",(amountWithoutTax * 1.12)))
  end

  def calculateRetentions
  	retention = 0
  	#raise retentionIva.to_yaml
  	@constant = Constant.last
  	if client.specialcontributor
  		retention = amountWithoutTax * 0.02
  	end
  		retention = retention + amountWithoutTax * @constant.tax * 1
  	
  	self.totalRetentions = retention
  	
  end

  def calculateTotalAmountPerceive
  	self.totalAmountPerceive = amountWithtTax - totalRetentions
  end
  #simple search rif
  def self.search(search)
    if search
    where('rif LIKE ?', "%#{search}%")
    else
      all
    end
end


  #BANCOS
  def banesco(linea)
    lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[3]
    finalFecha = lineaFecha.length
    fecha = lineaFecha[7..finalFecha]
    fecha = Date.parse(fecha).strftime("%Y-%m-%d")
    self.update_column(:date, fecha)
    lineaCuentaAcreditada = linea.gsub!(/\s+/, ' ').split(" ")[6]
    finalCuenta = lineaCuentaAcreditada.length
    cuentaElemetrica = lineaCuentaAcreditada[34..finalCuenta]
    self.update_column(:elemetricaAccount, cuentaElemetrica)
    lineaCuentaDebitada = linea.gsub!(/\s+/, ' ').split(" ")[5]
    finalCuentaDebitada = lineaCuentaDebitada.length
    cuentaCliente = lineaCuentaDebitada[31..finalCuentaDebitada]
    self.update_column(:clientAccount, cuentaCliente) 
    lineaMonto = linea.gsub!(/\s+/, ' ').split(" ")[7]
    finalMonto = lineaMonto.length
    monto = lineaMonto[6..finalMonto]
     monto = monto.gsub(/[.,]/, '.' => '', ',' => '.')
    self.update_column(:amountPaid, monto)
    self.update_column(:bank, "Banesco")
    balance = monto.to_f - amountWithtTax 
    self.update_column(:accountBalance, balance)
  end
  def provincial(linea)
    lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[6]
    finalFecha = lineaFecha.length
    fecha = lineaFecha[6..finalFecha]
    fecha = Date.parse(fecha).strftime("%Y-%m-%d")  
    self.update_column(:date, fecha)
    lineaCuentaAcreditada = linea.gsub!(/\s+/, ' ').split(" ")[10]
    finalCuenta = lineaCuentaAcreditada.length
    cuentaElemetrica = lineaCuentaAcreditada[15..finalCuenta-2]
    self.update_column(:clientAccount, "")
    self.update_column(:elemetricaAccount, "")
    self.update_column(:elemetricaAccount, cuentaElemetrica)  
    lineaMonto = linea.gsub!(/\s+/, ' ').split(" ")[8]
    finalMonto = lineaMonto.length
    monto = lineaMonto[14..finalMonto]
    monto = monto.gsub(/[.,]/, '.' => '', ',' => '.')
    self.update_column(:amountPaid, monto)
    self.update_column(:bank, "Provincial")
    balance = monto.to_f - amountWithtTax 
    self.update_column(:accountBalance, balance)
    cuenta = self.elemetricaAccount
    
  end
  #FALTA
  def mercantil(linea)
    raise linea.to_yaml            
    lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[0]
    lineaCuentaAcreditada = linea.gsub!(/\s+/, ' ').split(" ")[4]
    lineaMonto = linea.gsub!(/\s+/, ' ').split(" ")[5]
    fecha = lineaFecha[0..8]
    
    
    finalMonto = lineaMonto.length
    monto = lineaMonto[8..finalMonto]
  end
  def bicentenario(linea)
    lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[0]        
    finalFecha = lineaFecha.length
    fecha = lineaFecha[0..7]
    fecha = Date.parse(fecha).strftime("%Y-%m-%d")
    self.update_column(:date, fecha)
    lineaCuentaAcreditada = linea.gsub!(/\s+/, ' ').split(" ")[15]
    finalCuenta = lineaCuentaAcreditada.length
    cuentaElemetrica = lineaCuentaAcreditada[15..finalCuenta]
    self.update_column(:elemetricaAccount, cuentaElemetrica)
    lineaCuentaDebitada = linea.gsub!(/\s+/, ' ').split(" ")[13]
    finalCuentaDebitada = lineaCuentaDebitada.length
    cuentaCliente = lineaCuentaDebitada[14..finalCuentaDebitada]
    self.update_column(:clientAccount, cuentaCliente)
    lineaMonto = linea.gsub!(/\s+/, ' ').split(" ")[16]  
    finalMonto = lineaMonto.length
    monto = lineaMonto[10..finalMonto]
    monto = monto.gsub(/[.,]/, '.' => '', ',' => '.')
    self.update_column(:amountPaid, monto)
     self.update_column(:bank, "Bicentenario")
     balance = monto.to_f - amountWithtTax 
    self.update_column(:accountBalance, balance)
  end


end
