class Payment < ActiveRecord::Base
	mount_uploader :proof, ProofUploader
   def self.import(file)
 	 nombre = file.original_filename.to_s
 	

 
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
       
       
         else if linea.include? "Banesco Banco Universal"
             puts "El comprobante es de Banesco"
             lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[3]
             finalFecha = lineaFecha.length
             fecha = lineaFecha[7..finalFecha]
             puts fecha
             lineaCuentaAcreditada = linea.gsub!(/\s+/, ' ').split(" ")[6]
             puts lineaCuentaAcreditada
             lineaCuentaDebitada = linea.gsub!(/\s+/, ' ').split(" ")[5]
             puts lineaCuentaDebitada
             lineaMonto = linea.gsub!(/\s+/, ' ').split(" ")[7]
             finalMonto = lineaMonto.length
             monto = lineaMonto[6..finalMonto]
             puts monto
             else if linea.include? "Gracias por utilizar Provinet"
             	 puts "Es Provincial"
             	 lineaFecha = linea.gsub!(/\s+/, ' ').split(" ")[6]
                 finalFecha = lineaFecha.length
                 fecha = lineaFecha[6..finalFecha]
                 puts fecha
                 lineaCuentaAcreditada = linea.gsub!(/\s+/, ' ').split(" ")[10]
                 puts lineaCuentaAcreditada
                 lineaMonto = linea.gsub!(/\s+/, ' ').split(" ")[8]
                 finalMonto = lineaMonto.length
                 monto = lineaMonto[14..finalMonto]
                 puts monto
              else
                 puts "hola"  
               end
           end
        end
    end
    end
end
