require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroAna2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droAna2"
        @metadata.name = "droAna2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droAna2/bigZips/droAna2.2bit"
        super(**kwargs)
      end
    end
  end
end
