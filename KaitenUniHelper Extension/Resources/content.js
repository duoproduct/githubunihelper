// Пытаемся достать числовой ID либо из URL, либо из redirectPath
const requestMatch = location.pathname.match(/^\/sd\/requests\/(\d+)(?:\/|$)/);

let id = requestMatch ? requestMatch[1] : null;

if (!id && location.pathname === "/sd/login") {
  // Если нас перекинуло на /sd/login, берём redirectPath
  const rp = new URLSearchParams(location.search).get("redirectPath");
  if (rp) {
    const m = rp.match(/^\/sd\/requests\/(\d+)(?:\/|$)/);
    if (m) id = m[1];
  }
}

if (id) {
  // Сообщаем фону, чтобы открыл новую вкладку и закрыл текущую
  chrome.runtime.sendMessage({ action: "redirect", id });
}
