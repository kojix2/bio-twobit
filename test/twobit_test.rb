# frozen_string_literal: true

require "test_helper"

class TwoBitTest < Test::Unit::TestCase
  def foo_path
    File.expand_path("fixtures/foo.2bit", __dir__)
  end

  def foo
    @foo ||= Bio::TwoBit.new(foo_path, masked: true)
  end

  def foo_closed
    return @foo_closed if @foo_closed

    t = Bio::TwoBit.new(foo_path, masked: true)
    t.close
    @foo_closed = t
  end

  test "VERSION" do
    assert do
      Bio::TwoBit.const_defined?(:VERSION)
    end
  end

  test "open_with_block" do
    t = Bio::TwoBit.open(foo_path, masked: true) do |f|
      assert_equal({ "chr1" => 150, "chr2" => 100 }, f.chroms)
      assert_equal(false, f.closed?)
    end
    assert_equal(true, t.closed?)
  end

  test "new_with_block" do
    assert_raises(RuntimeError) do
      Bio::TwoBit.new(foo_path, masked: true) do |_f|
        0
      end
    end
  end

  test "path" do
    assert_equal(foo_path, foo.path)
    assert_equal(foo_path, foo_closed.path)
  end

  test "masked?" do
    assert_equal(true, foo.masked?)
    assert_equal(true, foo_closed.masked?)
    t = Bio::TwoBit.open(foo_path, masked: false)
    assert_equal(false, t.masked?)
    t.close
    t = Bio::TwoBit.open(foo_path)
    assert_equal(false, t.masked?)
    t.close
  end

  test "close" do
    t = Bio::TwoBit.new(foo_path, masked: true)
    assert_nothing_raised do
      assert_nil t.close
    end
  end

  test "closed?" do
    assert_equal false, foo.closed?
    assert_equal true, foo_closed.closed?
  end

  test "chroms" do
    assert_equal({ "chr1" => 150, "chr2" => 100 }, foo.chroms)
    assert_raise { foo_closed.chroms }
  end

  test "info" do
    assert_equal({ "file_size" => 161,
                   "hard_masked_length" => 150,
                   "nChroms" => 2,
                   "sequence_length" => 250,
                   "soft_masked_length" => 8 }, foo.info)
    assert_raise { foo_closed.info }
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
    assert_raise { foo_closed.sequence("chr1", 24, 74) }
  end

  test "bases" do
    assert_equal({ "A" => 0.08, "C" => 0.08, "G" => 0.08666666666666667, "T" => 0.08666666666666667 },
                 foo.bases("chr1"))
    assert_equal({ "A" => 0.12, "C" => 0.12, "T" => 0.12, "G" => 0.12 },
                 foo.bases("chr1", 24, 74))
    assert_equal({ "A" => 6, "C" => 6, "T" => 6, "G" => 7 },
                 foo.bases("chr1", 24, 75, fraction: false))
    assert_raise { foo_closed.bases("chr1") }
  end

  test "hard_masked_block" do
    assert_equal([[0, 50], [100, 150]], foo.hard_masked_blocks("chr1"))
    assert_equal([[0, 50]], foo.hard_masked_blocks("chr1", 25, 75))
    assert_equal([], foo.hard_masked_blocks("chr1", 75, 100))
    assert_equal([[100, 150]], foo.hard_masked_blocks("chr1", 75, 101))
    assert_equal([[50, 100]], foo.hard_masked_blocks("chr2"))
    assert_raise { foo_closed.hard_masked_blocks("chr1") }
  end

  test "soft_masked_block" do
    assert_equal([[62, 70]], foo.soft_masked_blocks("chr1"))
    assert_equal([], foo.soft_masked_blocks("chr1", 0, 50))
    assert_raise { foo_closed.soft_masked_blocks("chr1") }
  end
end
