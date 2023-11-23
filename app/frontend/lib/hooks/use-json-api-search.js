export const useJsonApiSearch = (setQuery) => {
  const onSearch = (value) => {
    setQuery((prev) => {
      return {
        ...prev,
        filter: {
          search: value
        }
      }
    })
  }

  return { onSearch }
}