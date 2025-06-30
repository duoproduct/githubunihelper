chrome.runtime.onMessage.addListener((msg, sender) => {
  if (msg.action === "redirect" && sender.tab) {
    const newUrl = `https://fevlake.kaiten.ru/${msg.id}`;

    // создаём новую вкладку рядом с текущей
    chrome.tabs.create({ url: newUrl, index: sender.tab.index + 1 }, () => {
      // закрываем исходную
      chrome.tabs.remove(sender.tab.id);
    });
  }
});
