import 'package:xml/xml.dart';

class TrimElementsVisitor with XmlVisitor {
  @override
  void visitCDATA(XmlCDATA node) {
    node.text = node.text.trim();
  }

  @override
  void visitText(XmlText node) {
    node.text = node.text.trim();
  }

  @override
  void visitElement(XmlElement node) {
    node.children.forEach(visit);
  }

  @override
  void visitDocument(XmlDocument node) => node.children.forEach(visit);

  @override
  void visitDocumentFragment(XmlDocumentFragment node) =>
      node.children.forEach(visit);
}
