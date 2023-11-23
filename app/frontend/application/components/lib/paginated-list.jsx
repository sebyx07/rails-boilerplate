import React from 'react';
import { FixedSizeList as List } from 'react-window';
import { Button, Spinner, Alert, ListGroup } from 'react-bootstrap';

export const PaginatedList = ({ height, pagination, identifier, renderItem, itemHeight }) => {
  const { items, isLastPage, loadMore, status } = pagination;

  // Row component for react-window
  const Row = ({ index, style }) => (
    <ListGroup.Item style={style} key={items[index][identifier]}>
      {renderItem(items[index])}
    </ListGroup.Item>
  );

  return (
    <div>
      {status === 'loading' && (
        <div className="text-center">
          <Spinner animation="border" role="status">
            <span className="visually-hidden">Loading...</span>
          </Spinner>
        </div>
      )}

      {status === 'error' && (
        <Alert variant="danger">
          Error loading items.
        </Alert>
      )}

      {items.length > 0 && (
        <List
          height={height} // Adjust based on your layout
          itemCount={items.length}
          itemSize={itemHeight}
          width={'100%'}
          outerElementType={CustomScrollbarsVirtualList}
        >
          {Row}
        </List>
      )}

      {status !== 'loading' && !isLastPage && (
        <div className="text-center mt-3">
          <Button onClick={loadMore} variant="primary">
            Load More
          </Button>
        </div>
      )}
    </div>
  );
};

// Custom component to wrap the list and apply Bootstrap's styles
const CustomScrollbarsVirtualList = React.forwardRef((props, ref) => (
  <ListGroup ref={ref} {...props} />
));

