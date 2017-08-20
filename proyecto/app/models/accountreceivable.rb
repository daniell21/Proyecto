class Accountreceivable < ActiveRecord::Base
  #Hasta Ahora los comprobantes de 100% banco no funcionan. No se pueden leer
   #Hasta Ahora los comprobantes de Benplus no funcionan. No se pueden leer
   #Resta por hacer validaciones de fecha y numero de cuenta a acreditar. MOnto tambien
  belongs_to :client
  belongs_to :constant 
  mount_uploader :document, DocumentUploader
  validates :client_id, presence: true
  validates :constant_id, presence: true
  validates :date, presence: true, on: :update
  validates :status, presence: true, on: :create
  validates :paymentType, presence: true, on: :update
  validates :month, presence: true, on: :create
  validates :paid, presence: true
  validates :bank, presence: true, on: :update
  validates :amountPaid, presence: true, on: :update
  validates :profitCode, presence: true
  validates :profitNumber, presence: true
  #por revisar
  #validates :checkNumber, presence: true, if: :validator? 
  #validates :depositNumber, presence: true, if: :validator? 

  
  
  after_save :importProof
  #revisar Tambien
  #before_save :validator
  before_save :calculateBaseAmount
  before_save :calculateBasicAmount
  before_save :calculateAmountWithTax
  before_save :calculateRetentions
  before_save :calculateTotalAmountPerceive

  before_save :validateAmountPaid
  before_save :existDepositNumber
  before_save :existTransferNumber
  before_save :existTransferNumberClient
  before_save :existCheckNumber
  before_save :existProfitCode
  before_save :existProfitNumber
  before_save :existElemetricaAccount
  before_save :existClientAccount

  def existDepositNumber
    if depositNumber
      validates_numericality_of :depositNumber
      validateDepositNumber
    end
    
  end

  def existTransferNumber
    if transferNumber
      validates_numericality_of :transferNumber
      validateTransferNumber
    end
    
  end
  def existTransferNumberClient
    if transferNumberClient
      validates_numericality_of :transferNumberClient
      validateTransferNumberClient
    end
    
  end
  def existCheckNumber
    if checkNumber
      validates_numericality_of :checkNumber
      validateCheckNumber
    end
    
  end
  def existProfitCode
    if profitCode
      validates_numericality_of :profitCode
      validateProfitCode
    end
    
  end
  def existProfitNumber
    if profitNumber
      validates_numericality_of :profitNumber
      validateProfitNumber
    end
    
  end
  def existElemetricaAccount
    if elemetricaAccount
      validates_numericality_of :elemetricaAccount
      validateElemetricaAccount
    end
    
  end
  def existClientAccount
    if clientAccount
      validates_numericality_of :clientAccount
      validateClientAccount
    end
    
  end




  def validateTransferNumber
    self.transferNumber = transferNumber.to_s.gsub(',', '.').to_i
  end
  def validateDepositNumber
    self.depositNumber = depositNumber.to_s.gsub(',', '.').to_i
  end
  def validateTransferNumberClient
    self.transferNumberClient = transferNumberClient.to_s.gsub(',', '.').to_i
  end
  def validateCheckNumber
    self.checkNumber = checkNumber.to_s.gsub(',', '.').to_i
  end
  def validateProfitCode
    self.profitCode = profitCode.to_s.gsub(',', '.').to_i
  end
  def validateProfitNumber
    self.profitNumber = profitNumber.to_s.gsub(',', '.').to_i
  end
  def validateElemetricaAccount
    self.elemetricaAccount = elemetricaAccount.to_s.gsub(',', '.').to_i
  end
  def validateClientAccount
    self.clientAccount = clientAccount.to_s.gsub(',', '.').to_i
  end
  
  def validateAmountPaid
    if amountPaid
      amount = amountPaid.to_s.gsub(',', '.').to_f
      self.amountPaid = ActionController::Base.helpers.number_with_precision(amount, :precision => 2)
      calculateBalance
    end

  end
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      accountreceivable = find_by(profitNumber: row["profitNumber"].to_i.to_s) || new

      client = Client.find_by(rif: row["client_id"].to_i.to_s)
      
      accountreceivable.attributes = row.to_hash.slice(*row.to_hash.keys)
      accountreceivable.client_id = client.id
      accountreceivable.paid = true
      accountreceivable.profitNumber = row["profitNumber"].to_i
      accountreceivable.profitCode = row["profitCode"].to_i
      accountreceivable.save!
    end
  end
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path)
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
  end

  def validator
    deposito = false
    if self.paymentType == "deposito"
      return true
    end
      return deposito
    
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

  	@constant = Constant.find(constant_id)
    
  	if !self.baseAmount
      
      self.baseAmount = @constant.amount * client.localAmount.to_i
   	end
   
  end
  def calculateBasicAmount
  	resultado = 0

  	client.discounts.each do |discount|
  		
  		resultado = resultado + discount.percentage

  		
  	end
    if client.specialDiscount
     resultado = resultado + client.specialDiscount.to_i
    end
  	self.amountWithoutTax = ((baseAmount * ( 1 - (resultado.to_f/100))))
  	
  	#raise (Settings.monthlyPayment * ( 1 - (client.discounts.find(1).percentage.to_f/100))).to_yaml
  	
  end

  def calculateAmountWithTax
  	#raise amountWithoutTax.to_yaml
  	
  	self.amountWithtTax =  eval(sprintf("%14.4f",(amountWithoutTax * 1.12)))
  end

  def calculateRetentions
  	retention = 0
  	#raise retentionIva.to_yaml
  	@constant = Constant.find(constant_id)
  	if client.specialcontributor
  		retention = amountWithoutTax * 0.02

  	end
  	retention = retention + amountWithoutTax * 0.12 * 1
  	
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
#Si la variable accountBalance es negativa, significa que pago menos de lo que debia
  def calculateBalance
    self.accountBalance =   amountWithtTax - self.amountPaid.to_f
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
