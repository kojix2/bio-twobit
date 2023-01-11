module Bio
  class TwoBit
    class Metadata < Struct.new(:id,
                                :name,
                                :url,
                                :description)
    end
  end
end
