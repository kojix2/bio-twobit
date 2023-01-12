require_relative "../reference_genome"

module Bio
  class TwoBit
    class ChrPic1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "chrPic1"
        @metadata.name = "chrPic1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/chrPic1/bigZips/chrPic1.2bit"
        super(**kwargs)
      end
    end
  end
end
