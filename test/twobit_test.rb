# frozen_string_literal: true

require "test_helper"

class TwobitTest < Test::Unit::TestCase
  def foo_path
    File.expand_path("fixtures/foo.2bit", __dir__)
  end

  def foo
    @foo ||= Twobit.new(foo_path, masked: true)
  end

  test "VERSION" do
    assert do
      ::Twobit.const_defined?(:VERSION)
    end
  end

  test "chroms" do
    assert_equal({ "chr1" => 150, "chr2" => 100 }, foo.chroms)
  end

  test "info" do
    assert_equal({ "file_size" => 161,
                   "hard_masked_length" => 150,
                   "nChroms" => 2,
                   "sequence_length" => 250,
                   "soft_masked_length" => 8 }, foo.info)
  end

  test "sequence" do
    assert_equal("N", foo.sequence("chr1", 1, 2))
    assert_equal("NN", foo.sequence("chr1", 1, 3))
    assert_equal("NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNACGTACGTACGTagctagctGATCGATCGTAGCTAGCTAGCTAGCTGATCNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN",
                 foo.sequence("chr1"))
    assert_equal("NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNACGTACGTACGTagctagctGATCGATCGTAGCTAGCTAGCTAGCTGATCNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN",
                 foo.sequence("chr1", 0, 1000))
    assert_equal("NNNNNNNNNNNNNNNNNNNNNNNNNNACGTACGTACGTagctagctGATC",
                 foo.sequence("chr1", 24, 74))
  end

  test "bases" do
    assert_equal({ "A" => 0.08, "C" => 0.08, "G" => 0.08666666666666667, "T" => 0.08666666666666667 },
                 foo.bases("chr1"))
    assert_equal({ "A" => 0.12, "C" => 0.12, "T" => 0.12, "G" => 0.12 },
                 foo.bases("chr1", 24, 74))
    assert_equal({ "A" => 6, "C" => 6, "T" => 6, "G" => 7 },
                 foo.bases("chr1", 24, 75, fraction: false))
  end

  test "hard_masked_block" do
    assert_equal([[0, 50], [100, 150]], foo.hard_masked_blocks("chr1"))
    assert_equal([[0, 50]], foo.hard_masked_blocks("chr1", 25, 75))
    assert_equal([], foo.hard_masked_blocks("chr1", 75, 100))
    assert_equal([[100, 150]], foo.hard_masked_blocks("chr1", 75, 101))
    assert_equal([[50, 100]], foo.hard_masked_blocks("chr2"))
  end

  test "soft_masked_block" do
    assert_equal([[62, 70]], foo.soft_masked_blocks("chr1"))
    assert_equal([], foo.soft_masked_blocks("chr1", 0, 50))
  end
end
