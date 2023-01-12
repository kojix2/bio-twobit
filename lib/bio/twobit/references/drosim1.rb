require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroSim1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droSim1"
        @metadata.name = "droSim1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droSim1/bigZips/droSim1.2bit"
        super(**kwargs)
      end
    end
  end
end
