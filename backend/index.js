import express from 'express'
import cors from 'cors'
import bodyParser from 'body-parser'
import { getCalcResults } from './getCalcResults.js'

const app = express()
app.use(cors())
var jsonParser = bodyParser.json()
const port = 3000

app.get('/getCalcResults', async (req, res) => {
  const test = async _ => {
    return getCalcResults("My get test")
  }
  
  test()
    .then(value => {
      console.log("in index " + value) // 1
      res.send({result:value})
    })
  
})

app.post('/postCalcResults', jsonParser, async (req, res) => {
  const test = async _ => {
    console.log("in post")
    console.log(req.body)
    return getCalcResults(JSON.stringify(req.body))
  }
  
  test()
    .then(value => {
      console.log(value)
      res.send(value)
    })
})

app.listen(port, () => {
  console.log(`listening on port ${port}`)
})