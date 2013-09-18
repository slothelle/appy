module AbbreviationHelper
  ABBREVIATIONS = {
    k: "knit",
    p: "purl",
    sts: "stitch/es",
    pm: "place marker",
    slm: "slip marker",
    sl: "slip",
    yo: "yarn over",
    k2tog: "knit two stitches together",
    ssk: "slip, slip, knit both slipped stitches together",
    co: "cast on",
    bo: "bind off",
    rs: "right side",
    ws: "wrong side",
    rpts: "repeat/s",
    tbl: "through the back loop"
  }

  def combine_stitches_with_definitions(stitches, definitions)
    stitches.values.zip(definitions.values)
  end

  def create_abbreviations(nested_abbrevs, pattern)
    nested_abbrevs.each do |sts, defs|
      next if sts == "" || defs == ""
      Abbreviation.create(stitch: sts, definition: defs, pattern: pattern)
    end
  end
end