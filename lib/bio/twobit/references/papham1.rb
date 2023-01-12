require_relative "../reference_genome"

module Bio
  class TwoBit
    class PapHam1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "papHam1"
        @metadata.name = "papHam1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/papHam1/bigZips/papHam1.2bit"
        super(**kwargs)
      end
    end
  end
end
