import { stringify } from "qs";
import http from "@/lib/transport/http";

export const useGetRequest = (query, url, options) => {
  // const { data, status } = useQuery(query, get(url, options));
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

export const deleteRequest = (url) => {
  return http.delete(url)
}