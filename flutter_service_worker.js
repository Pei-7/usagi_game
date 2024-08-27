'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "237160e37d0d0e2eb25cf8514e70e25c",
"version.json": "03c2ef01991286944238f674fad2c340",
"index.html": "9379f6aad16f20a5e595879547a70d59",
"/": "9379f6aad16f20a5e595879547a70d59",
"main.dart.js": "18f8aa4f613de56682af91896b273a78",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "8ffbe44355dcf0146f809403bffaaa5f",
"assets/AssetManifest.json": "3072a26eeecbbe626b063f7a46971083",
"assets/NOTICES": "2b24134e720bc8bb35cad336197ea3c9",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "ff5828b4d0be873df5b0f185d7868c5a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "ea92e0e74764749c8df6a147b6674e16",
"assets/fonts/MaterialIcons-Regular.otf": "bd2d900c7a6e2e07856e40ab3a158479",
"assets/assets/p13.png": "627a3dc5a192d4db96642d232aa4a942",
"assets/assets/p10.png": "25837f771767e2dbafea8ffc3a66e705",
"assets/assets/p14.png": "0e4ebb80d8c1eacf86a961cc41f894d4",
"assets/assets/drawerIcon.png": "258d32d7a03b6239c03a1e23d6b74b9b",
"assets/assets/p9_1.png": "7ff4e6b96bab67791a4a29afc46d7fa3",
"assets/assets/p9_2.png": "87830f3bb6b92592217e9aa03658d166",
"assets/assets/p5_2.png": "51e275dd00f736a3547c3d3861bb03a1",
"assets/assets/p11_1_2.png": "0acfe05944c1e6400bb18efee1310052",
"assets/assets/p11_3_1.png": "95bf245372d447b8b4c466adcebb5662",
"assets/assets/p2.png": "79e5a44ffb9b58908ae921eaeaa48bdd",
"assets/assets/p0.png": "cab98d51efb7aa4e7c5d97ff29e48e5a",
"assets/assets/p5_1.png": "c12a15d2c8cde581be8a8fb2583acf0c",
"assets/assets/p11_1_1.png": "400ef4996e8a4b5987345ba716a9b460",
"assets/assets/p11_3_2.png": "0793c50c5f7c65ab5445450cbe50cf79",
"assets/assets/p3_2.png": "eebb22d417c704bd80086200f050d687",
"assets/assets/p1_1.png": "866636de79dea729a4ea7e8e7735fb39",
"assets/assets/p4.png": "7a83c602853e00c497911cf1ae9dc20b",
"assets/assets/p6.png": "6d9df1d1a378b1dcd1549f2e3bb4e978",
"assets/assets/p3_1.png": "285c9a15a8df59ecaaa06ce0191c3af3",
"assets/assets/p1_2.png": "a2ae6e9cffbb9ebbbb57584babc39de5",
"assets/assets/p7.png": "7a3d5b33a3d47b0a33bb0819009d998d",
"assets/assets/p11_2_2.png": "4b1e80cf3392f1194eb580f03b64edaa",
"assets/assets/p11_2_1.png": "4047d19d20b3b4d3d49863ae7764737b",
"assets/assets/solution_3.png": "d14fcc7a24b2e35c958b9e3bb9cc7274",
"assets/assets/solution_2.png": "a58741660607e4dce0dc28041627528d",
"assets/assets/p11_4_2.png": "30a313cdc384e4a9d899bd97a7938e54",
"assets/assets/p11_4_1.png": "a20aac8772918cd2a877bde0f71e908c",
"assets/assets/solution_1.png": "927a05b72729dc6f9fc267592600d994",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
