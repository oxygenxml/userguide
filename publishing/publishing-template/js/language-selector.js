/*
 * Language selector: keeps the query (e.g. the search terms) and the anchor
 * of the current page when switching to another language.
 */
(function () {
  function keepQueryAndHash(event) {
    var link = event.target.closest('.wh_language a[hreflang]');
    if (link) {
      var url = new URL(link.getAttribute('href'), location.href);
      url.search = location.search;
      url.hash = location.hash;
      link.href = url.href;
    }
  }
  // Capture phase, so the link is updated before the browser follows it.
  document.addEventListener('click', keepQueryAndHash, true);
  document.addEventListener('auxclick', keepQueryAndHash, true);
})();
