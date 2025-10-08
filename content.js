// Copyright 2025 Lars Kakavandi-Nielsen
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
const shorts_string = "Shorts";
const complete_state = "complete";

const h2_tag = "h2";
const div_tag = "div";
const a_tag = "a"

const dismissible_id = "#dismissible";

function hideYoutubeShorts(tag, nearest) {
    document.querySelectorAll(tag).forEach(elm => {
        if (elm.textContent.trim() == shorts_string) {
            const container = elm.closest(nearest);
            if (container) {
                container.style.display = 'none';
            }
        }
    });
}

function hideAllYoutubeShortsElements() {

    hideYoutubeShorts(h2_tag, dismissible_id);
    hideYoutubeShorts(div_tag, a_tag);

    setInterval(hideAllYoutubeShortsElements, 1000);

}

hideAllYoutubeShortsElements();
