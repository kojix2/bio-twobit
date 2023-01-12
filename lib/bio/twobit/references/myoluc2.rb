require_relative "../reference_genome"

module Bio
  class TwoBit
    class MyoLuc2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "myoLuc2"
        @metadata.name = "myoLuc2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/myoLuc2/bigZips/myoLuc2.2bit"
        super(**kwargs)
      end
    end
  end
end
