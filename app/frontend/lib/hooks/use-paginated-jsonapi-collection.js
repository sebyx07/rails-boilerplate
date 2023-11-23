import {getRequestJSONAPI} from "~/lib/hooks/use-http";
import {useEffect, useState} from "react";

export const usePaginatedJsonapiCollection = (query, url, classModel) => {
  const [items, setItems] = useState([])
  const [status, setStatus] = useState('loading')
  const [meta, setMeta] = useState({})
  const [page, setPage] = useState(1)
  const [isLastPage, setIsLastPage] = useState(false)
  function loadMore() {
    if(isLastPage) return
    setPage(page + 1)
  }
  const jsonQuery = JSON.stringify(query)

  useEffect(() => {
    const options = {
      query: {
        ...query,
        page
      }
    }

    setStatus('loading')
    getRequestJSONAPI(url, options).then((response) => {
      const {data: { data, meta }, status} = response

      if(status > 299) {
        setStatus('error')
        console.error(response)
        return
      }

      const models = data.map((item) => new classModel(item))
      setMeta(meta)
      const { pageCount } = meta
      setIsLastPage(pageCount === page || pageCount === 0)
      setItems((prevItems) => [...prevItems, ...models])
      setStatus('success')
    })
  }, [jsonQuery, url, page]);

  useEffect(() => {
    setItems([])
    setPage(1)
  }, [jsonQuery]);

  return {items, status, loadMore, isLastPage, meta }
}