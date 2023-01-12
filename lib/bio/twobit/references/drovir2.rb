require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroVir2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droVir2"
        @metadata.name = "droVir2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droVir2/bigZips/droVir2.2bit"
        super(**kwargs)
      end
    end
  end
end
