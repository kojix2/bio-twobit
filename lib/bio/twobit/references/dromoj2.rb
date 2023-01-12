require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroMoj2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droMoj2"
        @metadata.name = "droMoj2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droMoj2/bigZips/droMoj2.2bit"
        super(**kwargs)
      end
    end
  end
end
