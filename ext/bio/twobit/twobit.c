#include "twobit.h"

#define SIZEOF_INT32 4
#define SIZEOF_INT64 8

#if SIZEOF_SHORT == SIZEOF_INT32
#define NUM2UINT32 NUM2USHORT
#define NUM2INT32 NUM2SHORT
#define UINT32_2NUM USHORT2NUM
#define INT32_2NUM SHORT2NUM
#elif SIZEOF_INT == SIZEOF_INT32
#define NUM2UINT32 NUM2UINT
#define NUM2INT32 NUM2INT
#define UINT32_2NUM UINT2NUM
#define INT32_2NUM INT2NUM
#elif SIZEOF_LONG == SIZEOF_INT32
#define NUM2UINT32 NUM2ULONG
#define NUM2INT32 NUM2LONG
#define UINT32_2NUM ULONG2NUM
#define INT32_2NUM LONG2NUM
#else
#error "Neither int, long, nor short is the same size as int32_t"
#endif

#if SIZEOF_INT == SIZEOF_INT64
#define NUM2UINT64 NUM2UINT
#define NUM2INT64 NUM2INT
#define UINT64_2NUM UINT2NUM
#define INT64_2NUM INT2NUM
#elif SIZEOF_LONG == SIZEOF_INT64
#define NUM2UINT64 NUM2ULONG
#define NUM2INT64 NUM2LONG
#define UINT64_2NUM ULONG2NUM
#define INT64_2NUM LONG2NUM
#elif SIZEOF_LONGLONG == SIZEOF_INT64
#define NUM2UINT64 NUM2ULL
#define NUM2INT64 NUM2LL
#define UINT64_2NUM ULL2NUM
#define INT64_2NUM LL2NUM
#else
#error "Neither int, long, nor short is the same size as int64_t"
#endif

VALUE mBio;
VALUE mTwoBit;

static void TwoBit_free(void *ptr);
static size_t TwoBit_memsize(const void *ptr);

static const rb_data_type_t TwoBit_type = {
    "TwoBit",
    {
        0,
        TwoBit_free,
        TwoBit_memsize,
    },
    0,
    0,
    RUBY_TYPED_FREE_IMMEDIATELY,
};

static void
TwoBit_free(void *ptr)
{
  // twobitClose checks for null
  twobitClose(ptr);
}

static size_t
TwoBit_memsize(const void *ptr)
{
  const TwoBit *data = ptr;

  return data ? sizeof(*data) : 0;
}

static TwoBit *getTwoBit(VALUE self)
{
  TwoBit *ptr = NULL;
  TypedData_Get_Struct(self, TwoBit, &TwoBit_type, ptr);

  return ptr;
}

static VALUE
twobit_allocate(VALUE klass)
{
  TwoBit *tb = NULL;

  return TypedData_Wrap_Struct(klass, &TwoBit_type, tb);
}

static VALUE
twobit_init(VALUE klass, VALUE fpath, VALUE storeMasked)
{
  char *path = NULL;
  int mask = 0;
  TwoBit *tb = NULL;

  path = StringValueCStr(fpath);
  mask = NUM2INT(storeMasked);

  tb = twobitOpen(path, mask);
  if (!tb)
  {
    twobitClose(tb);
    rb_raise(rb_eRuntimeError, "Could not open file %s", path);
    return Qnil;
  }
  DATA_PTR(klass) = tb;

  return klass;
}

static VALUE
twobit_close(VALUE self)
{
  TwoBit *tb = getTwoBit(self);
  if (tb)
  {
    twobitClose(tb);
    DATA_PTR(self) = NULL;
  }

  return Qnil;
}

static VALUE
twobit_info(VALUE self)
{
  TwoBit *tb = getTwoBit(self);

  if (!tb)
  {
    rb_raise(rb_eRuntimeError, "The 2bit file handle is not open!");
    return Qnil;
  }

  uint32_t i, j, foo;
  VALUE val;
  VALUE info = rb_hash_new();

  //file size
  val = UINT64_2NUM(tb->sz);
  if (!val)
    goto error;
  rb_hash_aset(info, rb_str_new2("file_size"), val);

  //nContigs
  val = UINT32_2NUM(tb->hdr->nChroms);
  if (!val)
    goto error;
  rb_hash_aset(info, rb_str_new2("nChroms"), val);

  //sequence length
  foo = 0;
  for (i = 0; i < tb->hdr->nChroms; i++)
  {
    foo += tb->idx->size[i];
  }
  val = UINT32_2NUM(foo);
  if (!val)
    goto error;
  rb_hash_aset(info, rb_str_new2("sequence_length"), val);

  //hard-masked length
  foo = 0;
  for (i = 0; i < tb->hdr->nChroms; i++)
  {
    for (j = 0; j < tb->idx->nBlockCount[i]; j++)
    {
      foo += tb->idx->nBlockSizes[i][j];
    }
  }
  val = UINT32_2NUM(foo);
  if (!val)
    goto error;
  rb_hash_aset(info, rb_str_new2("hard_masked_length"), val);

  //soft-masked length
  if (tb->idx->maskBlockStart)
  {
    foo = 0;
    for (i = 0; i < tb->hdr->nChroms; i++)
    {
      for (j = 0; j < tb->idx->maskBlockCount[i]; j++)
      {
        foo += tb->idx->maskBlockSizes[i][j];
      }
    }
    val = UINT32_2NUM(foo);
    if (!val)
      goto error;
    rb_hash_aset(info, rb_str_new2("soft_masked_length"), val);
  }

  return info;

error:
  rb_raise(rb_eRuntimeError, "Received an error while gathering information on the 2bit file!");
  return Qnil;
}

static VALUE
twobit_chroms(VALUE self)
{
  TwoBit *tb = getTwoBit(self);

  if (!tb)
  {
    rb_raise(rb_eRuntimeError, "The 2bit file handle is not open!");
    return Qnil;
  }

  uint32_t i;
  VALUE val;
  VALUE chroms = rb_hash_new();

  for (i = 0; i < tb->hdr->nChroms; i++)
  {
    val = UINT32_2NUM(tb->idx->size[i]);
    if (!val)
      goto error;
    rb_hash_aset(chroms, rb_str_new2(tb->cl->chrom[i]), val);
  }

  return chroms;

error:
  rb_raise(rb_eRuntimeError, "Received an error while adding an item to the output hash!");
  return Qnil;
}

static VALUE
twobit_sequence(VALUE self, VALUE chrom, VALUE rbstart, VALUE rbend)
{
  char *ch, *str;
  unsigned long startl = 0, endl = 0;
  uint32_t start, end, len;
  TwoBit *tb;

  ch = StringValueCStr(chrom);
  startl = NUM2UINT32(rbstart);
  endl = NUM2UINT32(rbend);
  tb = getTwoBit(self);

  if (!tb)
  {
    rb_raise(rb_eRuntimeError, "The 2bit file handle is not open!");
    return Qnil;
  }

  len = twobitChromLen(tb, ch);
  if (len == 0)
  {
    rb_raise(rb_eRuntimeError, "The chromosome %s does not exist in the 2bit file!", ch);
    return Qnil;
  }
  if (endl > len)
    endl = len;
  end = (uint32_t)endl;
  if (startl >= endl && startl > 0)
  {
    rb_raise(rb_eRuntimeError, "The start position %lu is greater than the end position %lu!", startl, endl);
    return Qnil;
  }
  start = (uint32_t)startl;

  str = twobitSequence(tb, ch, start, end);

  return rb_str_new2(str);
}

static VALUE
twobit_bases(VALUE self, VALUE chrom, VALUE start, VALUE end, VALUE fraction)
{
  char *ch;
  uint32_t st, en, fr;
  TwoBit *tb;
  void *o = NULL;
  VALUE val, hash;

  tb = getTwoBit(self);
  if (!tb)
  {
    rb_raise(rb_eRuntimeError, "The 2bit file handle is not open!");
    return Qnil;
  }

  ch = StringValueCStr(chrom);
  st = NUM2UINT32(start);
  en = NUM2UINT32(end);
  fr = NUM2INT(fraction);

  o = twobitBases(tb, ch, st, en, fr);
  if (!o)
  {
    rb_raise(rb_eRuntimeError, "Received an error while determining the per-base metrics.");
    return Qnil;
  }

  hash = rb_hash_new();

  if (fr)
  {
    val = DBL2NUM(((double *)o)[0]);
  }
  else
  {
    val = UINT32_2NUM(((uint32_t *)o)[0]);
  }
  rb_hash_aset(hash, rb_str_new2("A"), val);

  if (fr)
  {
    val = DBL2NUM(((double *)o)[1]);
  }
  else
  {
    val = UINT32_2NUM(((uint32_t *)o)[1]);
  }
  rb_hash_aset(hash, rb_str_new2("C"), val);

  if (fr)
  {
    val = DBL2NUM(((double *)o)[2]);
  }
  else
  {
    val = UINT32_2NUM(((uint32_t *)o)[2]);
  }
  rb_hash_aset(hash, rb_str_new2("T"), val);

  if (fr)
  {
    val = DBL2NUM(((double *)o)[3]);
  }
  else
  {
    val = UINT32_2NUM(((uint32_t *)o)[3]);
  }
  rb_hash_aset(hash, rb_str_new2("G"), val);

  free(o);

  return hash;
}

static VALUE
twobit_hard_masked_blocks(VALUE self, VALUE chrom, VALUE rbstart, VALUE rbend)
{
  char *ch;
  TwoBit *tb;
  unsigned long startl = 0, endl = 0, totalBlocks = 0, tid;
  uint32_t i, len, start, end, blockStart, blockEnd;
  VALUE val, ary;

  tb = getTwoBit(self);
  ch = StringValueCStr(chrom);
  startl = NUM2UINT32(rbstart);
  endl = NUM2UINT32(rbend);

  if (!tb)
  {
    rb_raise(rb_eRuntimeError, "The 2bit file handle is not open!");
    return Qnil;
  }

  //Get the chromosome ID
  for (i = 0; i < tb->hdr->nChroms; i++)
  {
    if (strcmp(tb->cl->chrom[i], ch) == 0)
    {
      tid = i;
      break;
    }
  }

  len = twobitChromLen(tb, ch);
  if (len == 0)
  {
    rb_raise(rb_eRuntimeError, "The chromosome %s doesn't exist in the 2bit file!", ch);
    return Qnil;
  }
  if (endl == 0)
    endl = len;
  if (endl > len)
    endl = len;
  end = (uint32_t)endl;
  if (startl > endl && startl > 0)
  {
    rb_raise(rb_eRuntimeError, "The start value must be less then the end value (and the end of the chromosome!");
    return Qnil;
  }
  start = (uint32_t)startl;

  //Count the total number of overlapping N-masked blocks
  for (i = 0; i < tb->idx->nBlockCount[tid]; i++)
  {
    blockStart = tb->idx->nBlockStart[tid][i];
    blockEnd = blockStart + tb->idx->nBlockSizes[tid][i];
    if (blockStart < end && blockEnd > start)
    {
      totalBlocks++;
    }
  }

  //Form the output
  ary = rb_ary_new2(totalBlocks);
  if (totalBlocks == 0)
    return ary;
  for (i = 0; i < tb->idx->nBlockCount[tid]; i++)
  {
    blockStart = tb->idx->nBlockStart[tid][i];
    blockEnd = blockStart + tb->idx->nBlockSizes[tid][i];
    if (blockStart < end && blockEnd > start)
    {
      val = rb_ary_new3(2, UINT32_2NUM(blockStart), UINT32_2NUM(blockEnd));
      rb_ary_push(ary, val);
    }
  }

  return ary;
}

static VALUE
twobit_soft_masked_blocks(VALUE self, VALUE chrom, VALUE rbstart, VALUE rbend)
{
  char *ch;
  TwoBit *tb;
  unsigned long startl = 0, endl = 0, totalBlocks = 0, tid;
  uint32_t i, len, start, end, blockStart, blockEnd;
  VALUE val, ary;

  tb = getTwoBit(self);
  ch = StringValueCStr(chrom);
  startl = NUM2UINT32(rbstart);
  endl = NUM2UINT32(rbend);

  if (!tb)
  {
    rb_raise(rb_eRuntimeError, "The 2bit file handle is not open!");
    return Qnil;
  }

  //Get the chromosome ID
  for (i = 0; i < tb->hdr->nChroms; i++)
  {
    if (strcmp(tb->cl->chrom[i], ch) == 0)
    {
      tid = i;
      break;
    }
  }

  len = twobitChromLen(tb, ch);
  if (len == 0)
  {
    rb_raise(rb_eRuntimeError, "The chromosome %s doesn't exist in the 2bit file!", ch);
    return Qnil;
  }
  if (endl == 0)
    endl = len;
  if (endl > len)
    endl = len;
  end = (uint32_t)endl;
  if (startl >= endl && startl > 0)
  {
    rb_raise(rb_eRuntimeError, "The start value must be less then the end value (and the end of the chromosome!");
    return Qnil;
  }
  start = (uint32_t)startl;

  if (!tb->idx->maskBlockStart)
  {
    rb_raise(rb_eRuntimeError, "The file was not opened with storeMasked=True! Consequently, there are no stored soft-masked regions.");
    return Qnil;
  }

  //Count the total number of overlapping N-masked blocks
  for (i = 0; i < tb->idx->maskBlockCount[tid]; i++)
  {
    blockStart = tb->idx->maskBlockStart[tid][i];
    blockEnd = blockStart + tb->idx->maskBlockSizes[tid][i];
    if (blockStart < end && blockEnd > start)
    {
      totalBlocks++;
    }
  }

  //Form the output
  ary = rb_ary_new2(totalBlocks);
  if (totalBlocks == 0)
    return ary;
  for (i = 0; i < tb->idx->maskBlockCount[tid]; i++)
  {
    blockStart = tb->idx->maskBlockStart[tid][i];
    blockEnd = blockStart + tb->idx->maskBlockSizes[tid][i];
    if (blockStart < end && blockEnd > start)
    {
      val = rb_ary_new3(2, UINT32_2NUM(blockStart), UINT32_2NUM(blockEnd));
      rb_ary_push(ary, val);
    }
  }

  return ary;
}

void Init_twobit(void)
{
  mBio = rb_define_module("Bio");
  mTwoBit = rb_define_class_under(mBio, "TwoBit", rb_cObject);

  rb_define_alloc_func(mTwoBit, twobit_allocate);

  rb_define_private_method(mTwoBit, "initialize_raw", twobit_init, 2);
  rb_define_method(mTwoBit, "close", twobit_close, 0);
  rb_define_method(mTwoBit, "info", twobit_info, 0);
  rb_define_method(mTwoBit, "chroms", twobit_chroms, 0);
  rb_define_private_method(mTwoBit, "sequence_raw", twobit_sequence, 3);
  rb_define_private_method(mTwoBit, "bases_raw", twobit_bases, 4);
  rb_define_private_method(mTwoBit, "hard_masked_blocks_raw", twobit_hard_masked_blocks, 3);
  rb_define_private_method(mTwoBit, "soft_masked_blocks_raw", twobit_soft_masked_blocks, 3);
}
