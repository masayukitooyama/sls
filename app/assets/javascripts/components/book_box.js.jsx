var BookBox = React.createClass({
  getInitialState: function(){
    // stateはComponentの状態を保持する
    // urlがpropsでAPIで取得したdataはstateになる。
    // stateはgetInitialState()というメソッドで初期値を与えられる
    return {data: []};
  },
  handleBookSubmit: function(book) {
    // POSTする
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: book,
      success: function(data) {
        data = data.data
        this.setState({data: this.state.data.concat([data.book])});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  // componentDidMountはReactのComponentが最初にrenderされる時に時に呼び出される。
  // ここで、APIにアクセスして、サーバーからデータを取得する。
  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      success: function(arg) {
        this.setState({data: arg.data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div className="bookBox">
        <h1>Books</h1>
        <BookList data={this.state.data}/>
        <BookForm onBookSubmit={this.handleBookSubmit}/>
      </div>
    );
  }
});

var BookList = React.createClass({
  render: function() {
    var bookNodes = this.props.data.map(function (book) {
      return (
        <Book key={book.id} name={book.book_name}>
          {book.isbn}
        </Book>
      )
    });
    return (
      <div className="bookList">
        {bookNodes}
      </div>
    );
  }
});

var Book = React.createClass({
  render: function() {
    return (
      <div className="book">
        <h2 className="bookName">
          {this.props.name}
        </h2>
      </div>
    );
  }
});

var BookForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var book_name = this.refs.book_name.value.trim();
    var isbn = this.refs.isbn.value.trim();
    var stocks = this.refs.stocks.value.trim();
    if (!book_name || !isbn || stocks < 0) {
      return(
        <div className="error">
          入力された値が不正です。
        </div>
      );
    }
    this.props.onBookSubmit({book_name: book_name, isbn: isbn, stocks: stocks}); // callback実行
    this.refs.book_name.value = '';
    this.refs.isbn.value = '';
    this.refs.stocks.value = '';
    return;
  },
  render: function() {
    return (
      <form className="bookForm" onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Book Title..." ref="book_name"/>
        <input type="text" placeholder="Book ISBN..." ref="isbn"/>
        <input type="number" placeholder="Book Stock ..." ref="stocks"/>
        <input type="submit" value="登録" className="btn btn-primary" />
      </form>
    );
  }
});
