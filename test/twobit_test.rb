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

  test "chrom_len" do
    assert_equal(150, foo.chrom_len("chr1"))
  end

  test "nchroms" do
    assert_equal(2, foo.nchroms)
  end

  test "file_size" do
    assert_equal(161, foo.file_size)
  end

  test "sequence" do
    assert_equal("NNNNNNNNNNNNNNNNNNNNNNNNNNACGTACGTACGTagctagctGATC",
                 foo.sequence("chr1", 24, 74))
  end

  test "bases_fraction" do
    assert_equal({ "A" => 0.12, "C" => 0.12, "T" => 0.12, "G" => 0.12 },
                 foo.bases("chr1", 24, 74, 1))
  end

  test "bases" do
    assert_equal({ "A" => 6, "C" => 6, "T" => 6, "G" => 7 },
                 foo.bases("chr1", 24, 75, 0))
  end
end
