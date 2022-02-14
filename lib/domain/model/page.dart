class DataPage<T> {
  final int page;
  final int pages;
  final List<T> data;

  DataPage(this.page, this.pages, this.data);
}
