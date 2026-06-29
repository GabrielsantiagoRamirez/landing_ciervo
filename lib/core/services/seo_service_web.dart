import 'package:web/web.dart' as web;

import '../constants/app_constants.dart';
import '../constants/seo_constants.dart';

void updateWebMeta({
  required String title,
  required String description,
  String? canonical,
}) {
  web.document.title = title;
  _setMeta('description', description);
  _setMeta('og:title', title, property: true);
  _setMeta('og:description', description, property: true);
  _setMeta('og:type', 'website', property: true);
  _setMeta('og:url', '${AppConstants.siteUrl}${canonical ?? '/'}', property: true);
  _setMeta('og:image', SeoConstants.ogImage, property: true);
  _setMeta('twitter:card', 'summary_large_image');
  _setMeta('twitter:title', title);
  _setMeta('twitter:description', description);
  _setMeta('twitter:image', SeoConstants.ogImage);

  if (canonical != null) {
    _setLink('canonical', '${AppConstants.siteUrl}$canonical');
  }
}

void _setMeta(String name, String content, {bool property = false}) {
  final selector = property ? 'meta[property="$name"]' : 'meta[name="$name"]';
  final element = web.document.querySelector(selector);

  if (element != null) {
    (element as web.HTMLMetaElement).content = content;
    return;
  }

  final meta = web.document.createElement('meta') as web.HTMLMetaElement
    ..content = content;

  if (property) {
    meta.setAttribute('property', name);
  } else {
    meta.name = name;
  }

  web.document.head?.append(meta);
}

void _setLink(String rel, String href) {
  final element = web.document.querySelector('link[rel="$rel"]');

  if (element != null) {
    (element as web.HTMLLinkElement).href = href;
    return;
  }

  final link = web.document.createElement('link') as web.HTMLLinkElement
    ..rel = rel
    ..href = href;

  web.document.head?.append(link);
}
