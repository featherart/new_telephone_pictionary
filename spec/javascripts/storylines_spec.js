describe('A Storyline', function() {

  // hmmm, is this how to test an ajax post?
  beforeEach(function() {
    spyOn($, 'ajax').andCallFake(function(options) {
      options.success(MOCK_GET_DATA);
  });

};