RSpec.describe "Authors", type: :request do
  describe "POST /authors" do
    let(:valid_author_params) do
      {
        name: "S. Bro",
        email: "bro@sbahj.info"
      }
    end

    context "with valid author params" do
      it "returns the author data" do
        post "/authors", params: { author: valid_author_params }

        # Check if the author was created successfully
        expect(response).to have_http_status(:created)

        # Adjust the following expectation based on your implementation
        expect(response.body).to include_json(
          id: a_kind_of(Integer),
          name: "S. Bro",
          email: "bro@sbahj.info"
        )
      end
    end

    # ...
  end
end
