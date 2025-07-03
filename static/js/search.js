function debounce(func, wait) {
    let timeout;
    return function () {
        let context = this;
        let args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            timeout = null;
            func.apply(context, args);
        }, wait);
    };
}

function getArticles() {
    let articles = [];
    let main = document.querySelector("main");
    if (!main) return articles;
    let nodes = main.querySelectorAll("article[data-date]");
    nodes.forEach(node => {
        let date = node.getAttribute("data-date");
        let html = node.innerHTML;
        let text = node.innerText || node.textContent || "";
        articles.push({ date, html, text, node });
    });
    return articles;
}

// Format date as "Wrote on July 3, 2025"
function formatDate(dateStr) {
    try {
        let d = new Date(dateStr);
        if (isNaN(d)) return dateStr;
        return "Wrote on " + d.toLocaleDateString(undefined, { year: "numeric", month: "long", day: "numeric" });
    } catch {
        return dateStr;
    }
}

function makeTeaser(text, terms) {
    let idx = -1;
    for (let t of terms) {
        let i = text.toLowerCase().indexOf(t.toLowerCase());
        if (i !== -1 && (idx === -1 || i < idx)) {
            idx = i;
        }
    }
    if (idx === -1) return text.slice(0, 120) + (text.length > 120 ? "..." : "");
    let start = Math.max(0, idx - 40);
    let end = Math.min(text.length, idx + 80);
    let teaser = text.slice(start, end);
    terms.forEach(t => {
        let re = new RegExp("(" + t.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ")", "gi");
        teaser = teaser.replace(re, "<b>$1</b>");
    });
    return (start > 0 ? "…" : "") + teaser + (end < text.length ? "…" : "");
}

function formatSearchResultItem(article, terms) {
    let href = `/#${article.date}`;
    let title = formatDate(article.date);
    let teaser = makeTeaser(article.text, terms);
    return `<a class="search-result-item" href="${href}">
        <div class="search-result-title">${title}</div>
        <div class="search-result-teaser">${teaser}</div>
    </a>`;
}

function showResults($searchResults, $searchResultsItems, results, terms) {
    $searchResultsItems.innerHTML = "";
    if (results.length === 0) {
        $searchResults.classList.remove("visible");
        return;
    }
    $searchResults.classList.add("visible");
    let ul = document.createElement('ul');
    ul.className = 'search-results-list';
    for (let article of results) {
        let li = document.createElement("li");
        li.innerHTML = formatSearchResultItem(article, terms);
        ul.appendChild(li);
    }
    $searchResultsItems.appendChild(ul);
}

function initSearch() {
    let $searchInput = document.getElementById("search");
    let $searchResults = document.querySelector(".search-results");
    let $searchResultsItems = document.querySelector(".search-results-items");
    let MAX_ITEMS = 10;
    let articles = getArticles();

    function doSearch() {
        let term = $searchInput.value.trim();
        if (term === "") {
            $searchResults.classList.remove("visible");
            $searchResultsItems.innerHTML = "";
            return;
        }
        let terms = term.split(/\s+/).filter(Boolean);
        let results = [];
        for (let article of articles) {
            let found = terms.some(t => article.text.toLowerCase().includes(t.toLowerCase()));
            if (found) results.push(article);
        }
        showResults($searchResults, $searchResultsItems, results.slice(0, MAX_ITEMS), terms);
    }

    $searchInput.addEventListener("keyup", debounce(doSearch, 150));
    $searchInput.addEventListener("focus", doSearch);

    // Fade out with transition
    window.addEventListener('click', function (e) {
        if (!$searchResults.contains(e.target) && e.target !== $searchInput) {
            $searchResults.classList.remove("visible");
        }
    });
}

if (document.readyState === "complete" ||
    (document.readyState !== "loading" && !document.documentElement.doScroll)
) {
    initSearch();
} else {
    document.addEventListener("DOMContentLoaded", initSearch);
}
