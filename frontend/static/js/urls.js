const mockURLs = {
  getMemberInfos: "https://e5f10338-d201-4709-83bc-c613a19d9a1f.mock.pstmn.io/member/1",
  postMemberEval: "https://0ebfef5f-0c78-4afe-83e7-08fc754994fe.mock.pstmn.io/get-eval"
}

const prodURLs = {
  getMemberInfos: "http://127.0.0.1:3000/member/1",
  postMemberEval: "http://127.0.0.1:3000/postCalcResults"
}

export const initURLs = (mode) => {
  if (mode == "not-mock") {
    return mockURLs  
  }
  else {
    return prodURLs
  } 
}