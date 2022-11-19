import { getMemberInfos } from "./static/js/member-infos.js";
import { createScen } from "./static/js/scen-eval.js";
import { initURLs } from "./static/js/urls.js"

const urls = initURLs("mock")
getMemberInfos(urls.getMemberInfos)
createScen(urls.postMemberEval)
