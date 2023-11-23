import axios from 'axios'
import ReactOnRails from 'react-on-rails';

const baseURL = '/api'
let headers = {
  'Content-Type': 'application/json',
}
let jsonAPiHeaders = {
  'Content-Type': 'application/vnd.api+json',
  'Accept': 'application/vnd.api+json'
}

headers = ReactOnRails.authenticityHeaders(headers)

export const http = axios.create({
  baseURL,
  timeout: 1000,
  headers
})

export const jsonAPIHTTP = axios.create({
  baseURL,
  timeout: 1000,
  headers: jsonAPiHeaders
})