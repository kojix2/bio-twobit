require_relative "../reference_genome"

module Bio
  class TwoBit
    class ChoHof1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "choHof1"
        @metadata.name = "choHof1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/choHof1/bigZips/choHof1.2bit"
        super(**kwargs)
      end
    end
  end
end
