import { stringify } from "qs";
import {http, jsonAPIHTTP} from "@/lib/transport/http";
import {useEffect, useState} from "react";

export const useGetRequest = (query, url, options) => {
  const [data, setData] = useState(null)
  const [status, setStatus] = useState(null)

  useEffect(() => {
    getRequest(url, options)
      .then((response) => {
        setData(response.data)
        setStatus(response.status)
      })
      .catch((error) => {
        setData(error.response.data)
        setStatus(error.response.status)
      })
  }, [query, url, options]);

  return { data, status }
}

export const useGetRequestJSONAPI = (query, url, options) => {
  const [data, setData] = useState(null)
  const [status, setStatus] = useState(null)

  useEffect(() => {
    getRequestJSONAPI(url, options)
      .then((response) => {
        setData(response.data)
        setStatus(response.status)
      })
      .catch((error) => {
        setData(error.response.data)
        setStatus(error.response.status)
      })
  }, [query, url, options]);

  return { data, status }
}

export const postRequest = (url, data = {}) => {
  return http.post(url, data)
}

export const getRequest = (url, options = {}) => {
  let { query } = options
  if(query){
    query = stringify(query)
    url = `${url}?${query}`
  }

  return http.get(url, options)
}

export const getRequestJSONAPI = (url, options = {}) => {
  let { query } = options
  if(query){
    query = stringify(query)
    url = `${url}?${query}`
  }

  return jsonAPIHTTP.get(url, options)
}

export const deleteRequest = (url) => {
  return http.delete(url)
}