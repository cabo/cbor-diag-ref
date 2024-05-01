require 'treetop'
require 'cbor-diag-parser'
require 'uri'
require 'open-uri'

class CBOR_DIAG::App_ref
  def self.trunc_for_error(s, n = 40)
    if s.size > n
      s[0...n].inspect << "..."
    else
      s.inspect
    end
  end

  def self.decode(_, s)

    # XXX this fetches a unchecked URL/file based on input -- needs some sanitizing...

    diag = begin
             URI(s).open.read
           rescue NoMethodError
             false              # avoid showing URI.open in the backtrace
           end
    diag ||= File.read(s)
    parser = CBOR_DIAGParser.new
    if result = parser.parse(diag)
      decoded = result.to_rb
      if CBOR::Sequence === decoded
        raise ArgumentError,
              "*** can't handle CBOR sequence #{trunc_for_error(diag)} as referenced from #{s.inspect}"
      end
      decoded
    else
      raise ArgumentError,
            "*** can't parse #{trunc_for_error(diag)} as referenced from #{s.inspect}: #{parser.failure_reason}"
    end
  end
end
