module ApplicationHelper
   def verifyChecksum( merchantID,  orderID,  amount,  authDesc,  workingKey,  checksum) 

    String str = merchantID+"|"+orderID+"|"+amount+"|"+authDesc+"|"+workingKey

    String newChecksum = Zlib::adler32(str).to_s

    return (newChecksum.eql?(checksum)) ? true : false

  end

  def getChecksum( merchantID,  orderID,  amount,  redirectUrl,  workingKey) 

    String str = merchantID + "|" + orderID + "|" + amount + "|" + redirectUrl + "|" + workingKey;

    return Zlib::adler32(str)

  end
end
