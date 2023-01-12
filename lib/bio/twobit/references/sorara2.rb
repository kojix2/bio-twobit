require_relative "../reference_genome"

module Bio
  class TwoBit
    class SorAra2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "sorAra2"
        @metadata.name = "sorAra2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/sorAra2/bigZips/sorAra2.2bit"
        super(**kwargs)
      end
    end
  end
end
