# typed: strict
# frozen_string_literal: true

module ShopifyAPI
  class Metafield < ShopifyAPI::Rest::Base
    extend T::Sig

    @prev_page_info = T.let(Concurrent::ThreadLocalVar.new { nil }, Concurrent::ThreadLocalVar)
    @next_page_info = T.let(Concurrent::ThreadLocalVar.new { nil }, Concurrent::ThreadLocalVar)

    @has_one = T.let({}, T::Hash[Symbol, Class])
    @has_many = T.let({}, T::Hash[Symbol, Class])
    @paths = T.let([
      {http_method: :get, operation: :get, ids: [], path: "metafields.json"},
      {http_method: :post, operation: :post, ids: [], path: "metafields.json"},
      {http_method: :get, operation: :get, ids: [], path: "metafields.json"},
      {http_method: :get, operation: :count, ids: [], path: "metafields/count.json"},
      {http_method: :get, operation: :get, ids: [:id], path: "metafields/<id>.json"},
      {http_method: :put, operation: :put, ids: [:id], path: "metafields/<id>.json"},
      {http_method: :delete, operation: :delete, ids: [:id], path: "metafields/<id>.json"}
    ], T::Array[T::Hash[String, T.any(T::Array[Symbol], String, Symbol)]])

    sig { returns(String) }
    attr_reader :key
    sig { returns(String) }
    attr_reader :namespace
    sig { returns(T::Array[String, Integer, Float]) }
    attr_reader :value
    sig { returns(T.nilable(String)) }
    attr_reader :created_at
    sig { returns(T.nilable(String)) }
    attr_reader :description
    sig { returns(T.nilable(Integer)) }
    attr_reader :id
    sig { returns(T.nilable(Integer)) }
    attr_reader :owner_id
    sig { returns(T.nilable(String)) }
    attr_reader :owner_resource
    sig { returns(T.nilable(String)) }
    attr_reader :type
    sig { returns(T.nilable(String)) }
    attr_reader :updated_at
    sig { returns(T.nilable(String)) }
    attr_reader :value_type

    class << self
      sig do
        params(
          session: Auth::Session,
          id: T.any(Integer, String),
          fields: T.untyped
        ).returns(T.nilable(Metafield))
      end
      def find(
        session:,
        id:,
        fields: nil
      )
        result = base_find(
          session: session,
          ids: {id: id},
          params: {fields: fields},
        )
        T.cast(result[0], T.nilable(Metafield))
      end

      sig do
        params(
          session: Auth::Session,
          id: T.any(Integer, String)
        ).returns(T.untyped)
      end
      def delete(
        session:,
        id:
      )
        request(
          http_method: :delete,
          operation: :delete,
          session: session,
          ids: {id: id},
          params: {},
        )
      end

      sig do
        params(
          session: Auth::Session,
          limit: T.untyped,
          since_id: T.untyped,
          created_at_min: T.untyped,
          created_at_max: T.untyped,
          updated_at_min: T.untyped,
          updated_at_max: T.untyped,
          namespace: T.untyped,
          key: T.untyped,
          type: T.untyped,
          value_type: T.untyped,
          fields: T.untyped,
          metafield: T.nilable(Hash),
          kwargs: T.untyped
        ).returns(T::Array[Metafield])
      end
      def all(
        session:,
        limit: nil,
        since_id: nil,
        created_at_min: nil,
        created_at_max: nil,
        updated_at_min: nil,
        updated_at_max: nil,
        namespace: nil,
        key: nil,
        type: nil,
        value_type: nil,
        fields: nil,
        metafield: nil,
        **kwargs
      )
        response = base_find(
          session: session,
          ids: {},
          params: {limit: limit, since_id: since_id, created_at_min: created_at_min, created_at_max: created_at_max, updated_at_min: updated_at_min, updated_at_max: updated_at_max, namespace: namespace, key: key, type: type, value_type: value_type, fields: fields, metafield: metafield}.merge(kwargs).compact,
        )

        T.cast(response, T::Array[Metafield])
      end

      sig do
        params(
          session: Auth::Session,
          kwargs: T.untyped
        ).returns(T.untyped)
      end
      def count(
        session:,
        **kwargs
      )
        request(
          http_method: :get,
          operation: :count,
          session: session,
          ids: {},
          params: {}.merge(kwargs).compact,
          body: {},
          entity: nil,
        )
      end

    end

  end
end