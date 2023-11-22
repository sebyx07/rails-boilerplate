import axios from 'axios'
import ReactOnRails from 'react-on-rails';

const baseURL = '/api'
let headers = {
  'Content-Type': 'application/json',
}
headers = ReactOnRails.authenticityHeaders(headers)

const http = axios.create({
  baseURL,
  timeout: 1000,
  headers
})

export default http