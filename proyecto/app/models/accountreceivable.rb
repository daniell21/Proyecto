class Accountreceivable < ActiveRecord::Base
#Hasta Ahora los comprobantes de 100% banco no funcionan. No se pueden leer
#Hasta Ahora los comprobantes de Benplus no funcionan. No se pueden leer
#Resta por hacer validaciones de fecha y numero de cuenta a acreditar. MOnto tambien
belongs_to :client
belongs_to :rate
mount_uploader :document, DocumentUploader
validates :client_id, presence: true
validates :rate_id, presence: true
validates :status, presence: true
validates :paymentType, presence: true, on: :update 
validates :month, presence: true
validates :bank, presence: true, on: :update
validates :amountPaid, presence: true, on: :update
validates :profitCode, presence: true, length: { minimum: 6 }
validates :profitNumber, presence: true, uniqueness: true, length: { minimum: 6 }

validates :checkNumber, presence: true, if: :validatorDeposit?
validates :depositNumber, presence: true, if: :validatorDeposit?
validates :transferNumberClient, presence: true, if: :validatorTransfer?
 validates_numericality_of :amountPaid, :allow_blank => true
 validates_numericality_of :transferNumber, :allow_blank => true
 validates_numericality_of :profitCode
 validates_numericality_of :profitNumber
 validates_numericality_of :clientAccount, :allow_blank => true
 validates_numericality_of :elemetricaAccount, :allow_blank => true
 validates_numericality_of :checkNumber, :allow_blank => true
 validates_numericality_of :depositNumber, :allow_blank => true
 validates_numericality_of :transferNumberClient, :allow_blank => true
  after_save :importProof
  #revisar Tambien
  #before_save :validator
  before_save :calculateBaseAmount
  before_save :calculateBasicAmount
  before_save :calculateAmountWithTax
  before_save :calculateBalance
  before_save :calculateRetentions
  before_save :calculateTotalAmountPerceive
  after_save :send_notification

  after_save :setDate
  before_save :setlastPayment





  
def emptyMassMailings?
    if massMailings
      return false
    else
      return true
    end
  end
 

  def validatorTransfer?
    
    unless self.paymentType == "transferencia"
      return false
    end
      return true
    
  end

  def validatorDeposit?
    
    unless self.paymentType == "deposito"
      return false
    end
      return true
    
  end
  
  def importProof
    
      #raise ((document.filename.to_s).length).to_yaml
     
      if ((document.filename.to_s).length) > 0
        path = '/home/daniel/Documentos/Proyecto/proyecto/public/uploads/'+month.to_s+'/'+((client.rif).to_s + client.name)+'/'+document.filename
        #path = '/home/daniel/Documentos/Proyecto/proyecto/public/uploads/Banesco.pdf'
        
        patch = path.tr("'", '"') 
      end
      
      if (document.filename.to_s).include? ".pdf"
        reader = PDF::Reader.new(Rails.root.join(patch))
        if ((document.filename.to_s).length) > 0
       	  #reader = PDF::Reader.new(document.filename)
           

            reader.pages.each do |page|
         	    texto = page.text
         	    #raise texto.to_yaml
              linea = texto.delete(' ')

              if (linea.length) > 0
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
        end
      end
      #else
      # raise (4+3).to_yaml  #No se adjunto comprobante bancario
     
    end
  end

  private

 
  def calculateBaseAmount

  	@rate = Rate.find(rate_id)
    
  	if !self.baseAmount
      
      self.baseAmount = @rate.amount * client.localAmount

   	end
   
  end
  def calculateBasicAmount
  	resultado = 0
    if self.amountWithoutTax.nil?
    	client.discounts.each do |discount|
    		resultado = resultado + discount.percentage
    	end
      
      if client.specialDiscount
       resultado = resultado + client.specialDiscount
      end

    	self.amountWithoutTax = ((baseAmount * ( 1 - (resultado.to_f/100))))
    end

  	
  	
  end

  def calculateAmountWithTax
  	
  	 self.amountWithTax =  eval(sprintf("%14.4f",(amountWithoutTax * 1.12)))
    
  end

  def calculateRetentions
      if self.totalRetentions.nil?
      	retention = 0
      	@rate = Rate.find(rate_id)
      	if client.specialcontributor
      		retention = amountWithoutTax * 0.02

      	end
      	retention = retention + amountWithoutTax * 0.12 * 1
      	
      	self.totalRetentions = retention
      end
    

  end

  def calculateTotalAmountPerceive
  	self.totalAmountPerceive = amountWithTax - totalRetentions

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
    
    self.accountBalance =   self.amountPaid.to_f - amountWithTax
    
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
    balance = monto.to_f - amountWithTax 
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
    balance = monto.to_f - amountWithTax 
    self.update_column(:accountBalance, balance)
    cuenta = self.elemetricaAccount
    
  end
  #FALTA
  def mercantil(linea)
    
    lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[0]
    fecha = lineaFecha[0..8]
    fecha = Date.parse(fecha).strftime("%Y-%m-%d")  
    self.update_column(:date, fecha)
    

    monto = 2500
    self.update_column(:amountPaid, 2500)
    self.update_column(:bank, "Mercantil")
    balance = monto.to_f - amountWithTax 
    self.update_column(:accountBalance, balance)
  
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
     balance = monto.to_f - amountWithTax 
    self.update_column(:accountBalance, balance)
  end
def send_notification
  unless self.amountPaid.nil?
    client = Client.find(client_id)
    emails = client.emails
    emails.each do |email|      
        PaymentMailer.delay.new_payment(self, client, email.email)
    end
    users = User.all
    users.each do |user|
      if user.role == "admin"
        NoticeMailer.delay.new_notice(user, self)     
      end
    end
  end
end

def setDate
 
  if self.amountPaid.nil?
    self.update_column(:paid, false)
  else
      self.update_column(:paid, true)
      self.update_column(:date, Time.now.strftime("%d/%m/%Y %H:%M"))
  end
end

def setlastPayment
  if self.amountPaid.nil?
  else  
    client = Client.find(client_id)
    client.update_column(:lastPayment, Time.now.strftime("%d/%m/%Y %H:%M"))
  
  end
end

end
