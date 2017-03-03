// Install search autocomplete
$(document).ready(function () {

    var searchFunction = function (request, response) {
        console.log("request", request.term);

        var searchTerm = request.term.toLowerCase();
        var res = [];

        var phraseIds = [];

        var words = searchTerm.split(" ");
        // Iterate over words
        for (var wi = 0; wi < words.length; wi++) {
            var cw = words[wi].trim();
            if (cw.length > 0) {
                // Iterate over keywords to find the ones that contains the word
                var newPhraseIds = [];
                for (var i = 0; i < keywords.length; i++) {
                    if (keywords[i].w.toLowerCase().indexOf(cw) == 0) {
                        // Word was found

                        console.log("word found ", keywords[i].p);
                        var phIds = keywords[i].p;
                        for (var pj = 0; pj < phIds.length; pj++) {
                            var pid = phIds[pj];

                            if (wi == 0) {
                                newPhraseIds.push(pid);
                            } else {
                                // Keep only phrase indices that contains all words
                                if (phraseIds.indexOf(pid) != -1) {
                                    newPhraseIds.push(pid);
                                }
                            }
                        }
                    }
                }
                phraseIds = newPhraseIds;
            }
        }

        if (phraseIds.length > 0) {
            for (var pi = 0; pi < phraseIds.length; pi++) {
                var wIdx = ph[phraseIds[pi]];

                var pStr = "";
                for (var wi = 0; wi < wIdx.length; wi++) {
                    var word = keywords[wIdx[wi]].w;
                    if (wi == 0) {
                        word = word.charAt(0).toUpperCase() + word.substr(1);
                    }
                    pStr += word;

                    if (wi < wIdx.length - 1) {
                        pStr += " ";
                    }
                }

                res.push(pStr.toLowerCase());
            }
        } else {
            var lastWord = words[words.length - 1];
            var beforeLastWord = request.term.substring(0, searchTerm.lastIndexOf(lastWord));

            for (var i = 0; i < keywords.length; i++) {
                if (keywords[i].w.toLowerCase().indexOf(cw) == 0) {
                    var proposal = beforeLastWord + keywords[i].w;
                    res.push(proposal.toLowerCase());
                }
            }
        }

        response(res);
    };

    var autocompleteObj = $("#textToSearch").autocomplete({
        source: searchFunction,
        minLength: 3
        /*select: function( event, ui ) {
         executeQuery();
         }*/
    });

    // Close autocomplete on ENTER
    $("#textToSearch").keydown(function (event) {
        if (event.which == 13) {
            $("#textToSearch").autocomplete("close");
        }
    });

    autocompleteObj = autocompleteObj.data("ui-autocomplete")._renderItem = function (ul, item) {
        // Text to search
        var tts = $("#textToSearch").val();

        tts = tts.toLowerCase();
        var words = tts.split(" ");

        var proposal = item.label;

        var pw = proposal.split(" ");
        var newProposal = "";

        for (var pwi = 0; pwi < pw.length; pwi++) {
            var cpw = pw[pwi];
            if (cpw.trim().length > 0) {

                // Iterate over words
                var added = false;
                for (var wi = 0; wi < words.length; wi++) {
                    var w = words[wi].trim();
                    if (w.length > 0) {
                        // Iterate over keywords to find the ones
                        // Highlight the text to search
                        var cpwh = cpw.replace(
                            new RegExp("(" + w + ")", 'i'),
                            "<span class='search-autocomplete-proposal'>$1</span>");

                        if (cpwh != cpw) {
                            newProposal += cpwh;
                            added = true;
                            break;
                        }
                    }
                }

                if (!added) {
                    newProposal += cpw;
                }

                if (pwi < pw.length - 1) {
                    newProposal += " ";
                }
            }
        }


        /*console.log("Proposal: ", newProposal);*/

        var li = $("<li>", {
            class: "ui-menu-item",
            "data-value": item.value,
            html: $("<div>", {
                class: "ui-menu-item-wrapper",
                html: newProposal
            })
        });
        return li.appendTo(ul);
    };
});