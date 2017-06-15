class Accountreceivable < ActiveRecord::Base
  belongs_to :client
validates :descripcion, presence: true #uniqueness: true
validates :total, presence: true #length: {minimum: 20}
#validates :username, format: { with: /regex/ }
mount_uploader :proof, ProofUploader
   def self.import(file)
 	puts "se imprimira el file"
 	nombre = file.original_filename.to_s
 	
 	puts nombre
 
 	reader = PDF::Reader.new(file.original_filename)
     if reader
         puts file.original_filename
         puts "ese fue el nombre"
     end
     reader.pages.each do |page|
 	texto = page.text
       #puts p.delete(' ')
       linea = texto.delete(' ')
       puts linea.gsub!(/\s+/, ' ').split(" ")
       if linea.include? "MercantilenLínea"
       	puts "El comprobante es del Banco Mercantil"
       lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[0]
       lineaCuentaAcreditada = linea.gsub!(/\s+/, ' ').split(" ")[4]
       lineaMonto = linea.gsub!(/\s+/, ' ').split(" ")[5]
       fecha = lineaFecha[0..8]
       puts "Fecha #{fecha}"
       if lineaCuentaAcreditada.include? "001008892270"
         puts "La transferencia fue realizada a Elemétrica"
       else
       	puts "trsnaferencia incorrecta"
       end
       finalMonto = lineaMonto.length
       monto = lineaMonto[8..finalMonto]
       puts "Monto: #{monto}"
       
       
       else if linea.include? "BanescOnline"
             puts "El comprobante es de Banesco"
       else
             
       end
       end
     end
 end
end
