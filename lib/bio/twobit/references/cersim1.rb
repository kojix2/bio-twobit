require_relative "../reference_genome"

module Bio
  class TwoBit
    class CerSim1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "cerSim1"
        @metadata.name = "cerSim1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/cerSim1/bigZips/cerSim1.2bit"
        super(**kwargs)
      end
    end
  end
end
