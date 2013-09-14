module PdfViewHelper
  def version(time)
    time.strftime("%B %Y")
  end
end