
class domainLayerException implements Exception {
  String cause;

  domainLayerException(this.cause);
  
  @override
  String toString() {
    return cause;
  }
}