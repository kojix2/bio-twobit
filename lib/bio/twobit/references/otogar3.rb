require_relative "../reference_genome"

module Bio
  class TwoBit
    class OtoGar3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "otoGar3"
        @metadata.name = "otoGar3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/otoGar3/bigZips/otoGar3.2bit"
        super(**kwargs)
      end
    end
  end
end
