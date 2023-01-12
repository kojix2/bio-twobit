require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroGri1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droGri1"
        @metadata.name = "droGri1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droGri1/bigZips/droGri1.2bit"
        super(**kwargs)
      end
    end
  end
end
