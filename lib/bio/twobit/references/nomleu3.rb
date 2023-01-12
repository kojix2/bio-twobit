require_relative "../reference_genome"

module Bio
  class TwoBit
    class NomLeu3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "nomLeu3"
        @metadata.name = "nomLeu3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/nomLeu3/bigZips/nomLeu3.2bit"
        super(**kwargs)
      end
    end
  end
end
