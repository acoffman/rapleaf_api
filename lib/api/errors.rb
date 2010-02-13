module RapleafApi
  
  class InvalidParams < Exception
  end

  class AcceptedException < Exception
  end

  class MalformedRequestException < Exception
  end

  class ApiKeyInvalidException < Exception
  end

  class RateLimitExceededException < Exception
  end

  class PersonNotFoundException < Exception
  end

  class InternalServerError < Exception
  end

end


