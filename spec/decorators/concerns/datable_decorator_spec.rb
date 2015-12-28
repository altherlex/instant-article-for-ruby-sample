require 'spec_helper'

describe DatableDecorator do
  class TestDatable
    include Draper::Decoratable
    include ActiveModel::Model
    include Alexandria::ConteudoAuditavel

    attr_accessor :ultima_atualizacao, :disponibilizacao
  end

  class TestDatableDecorator < Draper::Decorator
    delegate_all

    include DatableDecorator
  end

  let(:decorator) { TestDatable.new(ultima_atualizacao: ultima_atualizacao, disponibilizacao: disponibilizacao).decorate }
  let(:ultima_atualizacao) { { 'data' => '2014-07-18T12:00:00Z' } }
  let(:disponibilizacao) { { 'data' => '2014-07-17T12:00:00Z' } }

  it 'has formatted publish date' do
    expect(decorator.data_disponibilizacao).to eq '17/07/2014 às 09:00'
  end

  it 'has formatted publish date in specified format' do
    expect(decorator.data_disponibilizacao('%d/%m/%Y %H:%M')).to eq '17/07/2014 09:00'
  end

  it 'has formatted last updated date' do
    expect(decorator.data_ultima_atualizacao).to eq '18/07/2014 às 09:00'
  end

  it 'has formatted last updated date in specified format' do
    expect(decorator.data_ultima_atualizacao('%d/%m/%Y %H:%M')).to eq '18/07/2014 09:00'
  end

  context 'when there is not a publish date' do
    let(:disponibilizacao) { { 'data' => nil } }

    it 'returns nil' do
      expect(decorator.data_disponibilizacao('%d/%m/%Y %H:%M')).to be_nil
    end
  end

  context '#atualizado?' do
    context 'when disponibilizacao is smaller than ultima_atualizacao' do
      let(:ultima_atualizacao) { { 'data' => '2014-07-18T12:00:00Z' } }
      let(:disponibilizacao) { { 'data' => '2014-07-17T12:00:00Z' } }

      it 'is true' do
        expect(decorator.atualizado?).to be_true
      end
    end

    context 'when disponibilizacao is bigger than ultima_atualizacao' do
      let(:ultima_atualizacao) { { 'data' => '2014-07-16T12:00:00Z' } }
      let(:disponibilizacao) { { 'data' => '2014-07-17T12:00:00Z' } }

      it 'is false' do
        expect(decorator.atualizado?).to be_false
      end
    end

    context 'when disponibilizacao is equal than ultima_atualizacao' do
      let(:ultima_atualizacao) { { 'data' => '2014-07-17T12:00:00Z' } }
      let(:disponibilizacao) { { 'data' => '2014-07-17T12:00:00Z' } }

      it 'is true' do
        expect(decorator.atualizado?).to be_false
      end
    end
  end

  context "when dates have GMT" do
    let(:ultima_atualizacao) { { 'data' => '2014-07-18T12:00:00-03:00' } }
    let(:disponibilizacao) { { 'data' => '2014-07-17T12:00:00-03:00' } }

    it 'has formatted publish date' do
      expect(decorator.data_disponibilizacao).to eq '17/07/2014 às 12:00'
    end

    it 'has formatted last updated date' do
      expect(decorator.data_ultima_atualizacao).to eq '18/07/2014 às 12:00'
    end
  end
end
