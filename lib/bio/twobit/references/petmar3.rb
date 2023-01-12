require_relative "../reference_genome"

module Bio
  class TwoBit
    class PetMar3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "petMar3"
        @metadata.name = "petMar3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/petMar3/bigZips/petMar3.2bit"
        super(**kwargs)
      end
    end
  end
end
