import {usePaginatedJsonapiCollection} from "~/lib/hooks/use-paginated-jsonapi-collection";
import {Post} from "~/application/models/post";
import {PaginatedList} from "~/application/components/lib/paginated-list";
import {Search} from "~/application/components/lib/search";
import {useState} from "react";
import {useJsonApiSearch} from "~/lib/hooks/use-json-api-search";

const HomePage = () => {
  const url = '/posts'
  const [query, setQuery] = useState({})
  const search = useJsonApiSearch(setQuery)
  const pagination = usePaginatedJsonapiCollection(query, url, Post)

  return (
    <div>
      <h1>Home Page</h1>

      <Search search={search} className='mb-4'/>
      <PaginatedList height={500} itemHeight={50} pagination={pagination} identifier='id' renderItem={(post) => {
        return(
          <div>
            {post.title}
          </div>
        )
      }}/>
    </div>
  );
}

export default HomePage;