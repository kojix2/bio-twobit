require_relative "../reference_genome"

module Bio
  class TwoBit
    class Danrer11 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "danRer11"
        @metadata.name = "danRer11"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/danRer11/bigZips/danRer11.2bit"
        super(**kwargs)
      end
    end
  end
end
